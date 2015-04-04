import sys
import string
import datetime

def main():
	Today = datetime.date.today()
	year = Today.year
	month = Today.month
	for i in range(string.atoi(sys.argv[1])):
		print "%d%02d" %(year, month)
		month = month-1
		if month == 0:
			year = year-1
			month = 12

if __name__ == "__main__":
	main()
			
