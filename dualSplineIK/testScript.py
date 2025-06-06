try:
	for i in range(5):
		print(f"pop! - {i}")
		assert not i
except:
	raise AssertionError(f"test - task failed successfully: - {i}")
finally:
	print("okay we're done")

print(".... wait there's more??")