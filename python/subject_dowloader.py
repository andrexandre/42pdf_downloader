import sys
import requests
import subprocess # Cria processos
import os # Ve se o ficheiro ou diretorio existe


def subject_dowloader():
	
	if (len(sys.argv) < 2):
		print("Not enougth args")
		return

	subjectName: str = sys.argv[1]
	result = subprocess.run(f"cat 'database.txt' | grep '{subjectName}' | tail '-n 1'", shell=True, capture_output=True, text=True)
	
	# print(result.stdout)
	print(sys.argv[1] + " downloaded!")
	if (result.stderr):
		print(result.stderr)
		return
	else:
		line = result.stdout
		id = line[0 : line.find(' ')]
		content = requests.get(f'https://cdn.intra.42.fr/pdf/pdf/{id}/en.subject.pdf')

		with open(f"{subjectName}.pdf", 'w+b') as pdf:
			pdf.write(content.content)

subject_dowloader()
#teste

# https://raw.githubusercontent.com/andrexandre/42pdf_downloader/refs/heads/main/pdf_db.txt
# verificar se  o ficheiro 	existe se nao existeir baixar da cloud