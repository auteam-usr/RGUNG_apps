import random
import time

from transliterate import translit
import requests
from bs4 import BeautifulSoup
import multiprocessing as mp
import os

BASE_URL = 'https://geoadm.com'
SEARCH_LIST = ['Техникумы', 'Институты', 'Университеты', 'Колледжи', 'Академии', 'Училища', 'Профессиональные_лицеи']


def get_all_regions() -> list:
	soup = BeautifulSoup(requests.get(BASE_URL).text, 'html.parser')
	links = []
	for tr in soup.find_all('table')[0].find_all('tr'):
		if len(tr.find_all('td')[0].find_all('a')):
			links.append(tr.find_all('td')[0].find_all('a')[0]['href'])
	return links


def get_all_cities(region_link) -> list:
	try:
		soup = BeautifulSoup(requests.get(BASE_URL + region_link).text, 'html.parser')
	except:
		time.sleep(random.randint(1, 5))
		soup = BeautifulSoup(requests.get(BASE_URL + region_link).text, 'html.parser')
	names = []
	if len(soup.find_all('table')):
		for tr in soup.find_all('table')[-1].find_all('tr'):
			if tr.find_all('td')[1].get_text() != 'Название':
				names.append(tr.find_all('td')[1].get_text().replace('(Оспаривается)', ''))
	return names


def write_csv(data) -> None:
	name = data[0]
	cities = data[1]
	with open(os.path.join('program_data', name + '.txt'), 'a', encoding='utf-8') as file:
		for city in cities:
			city = translit(f'https://2gis.ru/{city.lower()}/search/', 'ru', reversed=True).replace(' ', '').replace('-', '').replace("'", '')
			file.write(city + name + '\n')


def main():
	print('Создание файлов с регионами...')
	for i, region in enumerate(get_all_regions()):
		print(f'Парсинг региона: {region}')
		cities = get_all_cities(region)
		with mp.Pool(mp.cpu_count()) as pool:
			pool.map(write_csv, [(name, cities) for name in SEARCH_LIST])
	print('Файлы с регионами созданы!')


if __name__ == '__main__':
	main()
