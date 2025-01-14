# to be included by 42pdf

start_id=$(cat $db_name | tail -n 1 | awk '{print $1}')
id_batch_size=1000
let start_id=start_id+1
let end_id=start_id+id_batch_size

update_database() {
	echo Started updating from $start_id to $end_id
	threads_num=200
	seq $start_id $end_id | xargs -P $threads_num -I {} bash -c '
		url=https://cdn.intra.42.fr/pdf/pdf/{}/en.subject.pdf
		status_code=$(curl -s -f -o /dev/null -w "%{http_code}\n" --head $url)
		if [ "$status_code" -eq 200 ]; then
			pdf_name=$(curl -s -f -o - $url | pdftotext -l 1 - - | head -n 1)
			echo "{} $pdf_name" >> pdf_db.txt
		fi
	'
	sort -n -o $db_name $db_name
}

update_database_in_order() {
	echo Started updating in order from $start_id to $end_id
	for (( i=start_id; i<=end_id; i++ ))
	do
		url=https://cdn.intra.42.fr/pdf/pdf/$i/en.subject.pdf
		status_code=$(curl -s -f -o /dev/null -w "%{http_code}\n" --head $url)
		if [ "$status_code" -eq 200 ]; then
			pdf_name=$(curl -s -f -o - $url | pdftotext -l 1 - - | head -n 1)
			echo "$i $pdf_name" >> $db_name
		fi
	done
}

create_pdf_id_db_super_fast() {
	CMD=gobuster
	[ -d "$HOME/.local/bin" ] || mkdir -p "$HOME/.local/bin"
	[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"
	if ! command -v $CMD &> /dev/null; then
		echo Downloading $CMD...
		TEMP_DIR=$(mktemp -d)
		cd $TEMP_DIR
		apt-get download $CMD > /dev/null
		dpkg -x $CMD*.deb $TEMP_DIR/$CMD
		rm $CMD*.deb
		cp $TEMP_DIR/$CMD/usr/bin/$CMD $HOME/.local/bin
		rm -rf $TEMP_DIR/$CMD
		cd - > /dev/null
		rmdir $TEMP_DIR
	fi
	# create url list for gobuster
	list_name=semi_url_db.txt
	url=/en.subject.pdf
	echo -n > $list_name
	for ((i=start_id; i<=end_id; i++)); do
		echo "$i$url" >> $list_name
	done

	threads_num=50
	pdf_id_db_name=pdf_id_db.txt
	echo Creating pdf_id_db with gobuster
	gobuster -q -n -u https://cdn.intra.42.fr/pdf/pdf -w $list_name -t $threads_num > $pdf_id_db_name

	rm $list_name
	sed -i 's/\/en\.subject\.pdf//g' $pdf_id_db_name
	sed -i 's/\///g' $pdf_id_db_name
	sort -no $pdf_id_db_name $pdf_id_db_name
}
update_database_super_fast() {
	create_pdf_id_db_super_fast

	echo Started updating from $start_id to $end_id
	threads_num=200
	cat $pdf_id_db_name | xargs -P $threads_num -I {} bash -c '
		url=https://cdn.intra.42.fr/pdf/pdf/{}/en.subject.pdf
		pdf_name=$(curl -s -f -o - $url | pdftotext -l 1 - - | head -n 1)
		echo "{} $pdf_name" >> pdf_db.txt
	'
	rm $pdf_id_db_name
	sort -n -o $db_name $db_name
}

migrate_database() {
	old_db_name=old_pdf_db.txt
	if [ ! -f $old_db_name ]; then
		echo No file $old_db_name found, creating based on $db_name
		cp $db_name $old_db_name
		echo "$db_name will be cleaned in 5 seconds"
		sleep 5
		echo "1560 C Piscine" > $db_name
		return 1
	fi
	updating_started=false
	while IFS= read -r curr_line; do
		if [[ "$curr_line" == "$start_id" ]]; then
			updating_started=true
			echo Started migration from $start_id
			continue
		fi
		if [ "$updating_started" == true ]; then
			start_id=$(echo $curr_line | awk '{print $1}')
			url=https://cdn.intra.42.fr/pdf/pdf/$start_id/en.subject.pdf
			status_code=$(curl -s -f -o /dev/null -w "%{http_code}\n" --head $url)
			if [ "$status_code" -eq 200 ]; then
				pdf_name=$(curl -s -f -o - $url | pdftotext -l 1 - - | head -n 1)
				echo "$curr_line $pdf_name" >> $db_name
			fi
		fi
	done < $old_db_name
	if [ "$updating_started" == false ]; then
		echo There is nothing to migrate
	else
		echo Everything migrated successfully
	fi
}
