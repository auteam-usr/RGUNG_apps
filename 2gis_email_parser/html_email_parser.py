import multiprocessing as mp
import os.path

import requests
import re
import csv


REGEXP = r'[^@]+@[^@]+\.[^@]+'


def get_emails_from_html(link: list):
	try:
		data = requests.get(link[1]).text
	except:
		return [link[0], []]
	return [link[0], re.findall(REGEXP, data)]


def main(links: list):
	pool = mp.Pool(mp.cpu_count())
	answers = pool.map(get_emails_from_html, links)
	return answers


def parse_file(filename):
	print(f'Парсинг ссылок с сайтов в файле {filename}')
	links = []
	with open(os.path.join('program_data', filename), 'r', encoding='utf-8') as csvfile:
		site_index = -1
		for i, line in enumerate(csv.reader(csvfile)):
			if i == 0:
				site_index = line.index('Веб-сайт 1')
				continue
			links.append([line[0], line[site_index]])
	answers = main(links)
	with open(os.path.join('program_data', filename.replace('.csv', '_ИТОГ.csv')), 'w', encoding='utf-8') as new_file:
		for answer in answers:
			new_file.write(','.join(answer) + '\n')
