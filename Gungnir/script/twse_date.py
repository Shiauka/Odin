import sys
import string
import datetime
from datetime import timedelta

def main():
	#pattern = "%2F"
	Today = datetime.date.today()
	a_day = timedelta(days=1)
	for i in range(string.atoi(sys.argv[1])):
		year = Today.year
		month = Today.month
		day = Today.day
		#print "%d%s%02d%s%02d" %(year-1911,pattern, month, pattern, day)
		print "%d%02d%02d" %(year, month, day) 
		Today -= a_day
		
		

if __name__ == "__main__":
	main()
			
