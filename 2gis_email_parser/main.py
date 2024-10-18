import os
import citties_parser
import html_email_parser


def prepare_parser_2gis():
	global parser_2gis, return_args
	try:
		del parser_2gis
	except:
		pass
	try:
		del return_args
	except:
		pass
	try:
		os.system('powershell -command "Get-Process chrome | ForEach-Object { $_.CloseMainWindow() | Out-Null}"')
	except:
		pass
	if 'main.py' in os.listdir('parser_2gis'):
		os.rename(os.path.join('parser_2gis', 'main.py'), os.path.join('parser_2gis', 'main_file.py'))
		with open(os.path.join('parser_2gis', '__init__.py'), 'r', encoding='utf-8') as f:
			code = f.read()
		with open(os.path.join('parser_2gis', '__init__.py'), 'w', encoding='utf-8') as f:
			f.write(code.replace('.main', '.main_file'))
	import parser_2gis

	def return_args():
		args = parser_2gis.main_file.argparse.Namespace(
			url=URLS,
			output_path=os.path.abspath(os.path.join('program_data', OUTPUT_PATH)),
			format='csv',
		)
		config_args = parser_2gis.main_file.unwrap_dot_dict(vars(args))
		config = parser_2gis.main_file.Configuration(**config_args)
		return args, config

	parser_2gis.main_file.parse_arguments = return_args


URLS = []
OUTPUT_PATH = ''


def chunks(lst, n):
	for i in range(0, len(lst), n):
		yield lst[i:i + n]


def main():
	global URLS, OUTPUT_PATH
	citties_parser.main()
	for file in os.listdir('program_data'):
		if file.endswith('.txt'):
			prepare_parser_2gis()
			with open(os.path.join('program_data', file), 'r', encoding='utf-8') as f:
				urls = [line for line in f.readlines()]
			OUTPUT_PATH = file.replace('.txt', '.csv')
			for url_list in chunks(urls, 200):
				URLS = url_list
				parser_2gis.main()
			print(f'Парсинг {file} завершен!')
	for file in os.listdir('program_data'):
		if file.endswith('.csv'):
			html_email_parser.parse_file(file)


if __name__ == '__main__':
	main()
