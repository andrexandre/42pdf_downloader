import requests 
import PyPDF2
import subprocess # Cria processos
import os # Ve se o ficheiro ou diretorio existe
import dataclasses

MAX_ID = 1600
MIN_ID = 1560

# cria a pasta do piscine e coloca todos os ficheiros na pasta
# def save_piscine_file(old_file_name: str ,new_file_name: str):
# 	if (os.path.exists('./Piscine') == False):
# 		result = subprocess.run(['mkdir', 'Piscine'], capture_output=True, text=True)
# 		print("Saída do comando 1:")
# 		print(result.stdout)
# 		print("Erros do comando 1:")
# 		print(result.stderr)

# 	new_file_name = new_file_name.strip()
# 	new_file_name = new_file_name.replace(' ', '_')

# 	new_file_name = "./Piscine/" + new_file_name + ".pdf"
# 	result = subprocess.run(['cp', old_file_name, new_file_name], capture_output=True, text=True)
# 	print("Saída do comando 2:")
# 	print(result.stdout)
# 	print("Erros do comando 2:")
# 	print(result.stderr)


def filldb(id, db, file):
	reader = PyPDF2.PdfReader(file)
	
	for page in reader.pages:
		texto = page.extract_text()
		
		line = texto.split('\n')
		if (line[0] == 'C Piscine'):
			db.write((str(id) + " " + (line[1].replace(' ', '_')) + '\n'))
		else:
			db.write((str(id) + " " + line[0] + '\n'))


		print(line[0])
		break



def main():
	
	db =  open('database.txt', 'a')
	
	for id in range(MIN_ID, MAX_ID):
		content = requests.get(f'https://cdn.intra.42.fr/pdf/pdf/{id}/en.subject.pdf')
		if (content.status_code == 404):
			continue
		
		with open(f'{id}.pdf', 'w+b') as pdf:
			pdf.write(content.content)
			filldb(id, db, pdf)
			# Ele fecha o ficheiro depois que o bloco termina
		
		print(id)
		subprocess.run(['rm', f'{id}.pdf'], capture_output=True, text=True)
		# break
	db.close()


main()
