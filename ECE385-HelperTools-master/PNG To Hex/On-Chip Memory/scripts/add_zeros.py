
filename = input("What's the image name? ")
f = open("../sprite_bytes/" + filename + ".txt", "r")
outFile = open("../sprite_bytes/" + filename + '_2.txt', 'w')

for line in f:
	a = line[0: len(line) - 1]
	if len(line) != 7:
		a = line[0:len(line) - 1]
		for i in range(7-len(line)):
			a = a + "0"
	
	outFile.write(a + "\n")