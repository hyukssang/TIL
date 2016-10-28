# Mergesort lowest -> highest value order
# Range: [left, right]
# Returns sorted array if not empty; Otherwise, return None
def mergesort(arr, left, right):
	if right <= left:
		return

	mid = (right + left)/2

	mergesort(arr, left, mid)
	mergesort(arr, mid+1, right)
	merge(arr, left, mid, right+1)
	return arr

# Range: [left, right) -> [left, mid], [mid+1, right)
def merge(arr, left, mid, right):
	newArray = []
	i1 = left
	i2 = mid+1
	for i in range(left, right):
		if i1 == mid + 1:
			newArray.append(arr[i2])
			i2 += 1
		elif i2 == right:
			newArray.append(arr[i1])
			i1 += 1
		else:
			if arr[i1] <= arr[i2]:
				newArray.append(arr[i1])
				i1 += 1
			else:
				newArray.append(arr[i2])
				i2 += 1
	arr[left:right] = newArray


# # SIMPLE TEST CASES
# # Even number, same number
# test1 = mergesort([1,1,1,1,1,1], 0, 5)
# # Odd number, mixed
# test2 = mergesort([3,1,2,6,5], 0, 4)
# # Random
# test3 = mergesort([1,4,3,3,3,3], 0, 5)
# # Default
# test4 = mergesort([5,2,4,7,1,3,2,6], 0, 6)
# # Empty
# test5 = mergesort([], 0, 0)

# print(test1)
# print(test2)
# print(test3)
# print(test4)
# print(test5)



