# 1.3
# inputStr = 'Mr John Smith    '
# inputStrLength = 13 # Length of 'Mr John Smith'
# inputStr = list(inputStr)

# # Method1
# inputStr = inputStr.split()
# inputStr = '%20'.join(inputStr)

# # Method2
# i2 = len(inputStr) - 1
# for i1 in range(inputStrLength - 1, -1, -1):
# 	if inputStr[i1] != ' ':
# 		inputStr[i2] = inputStr[i1]
# 		i2 -= 1
# 	else:
# 		inputStr[i2] = '0'
# 		inputStr[i2 - 1] = '2'
# 		inputStr[i2 - 2] = '%'
# 		i2 -= 3
# print(inputStr)

# 1.4
inputStr = 'octttco'

col = {}
for c in inputStr:
	if c != ' ':
		if c not in col:
			col[c] = True	# True means odd
		else:
			if col[c] == True:
				col[c] = False
			elif col[c] == False:
				col[c] = True


oddCount = 0
for k in col:
	if col[k]:
		oddCount += 1

if oddCount > 1:
	print("False")
else:
	print("True")
