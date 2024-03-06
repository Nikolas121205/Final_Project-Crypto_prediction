import requests

# Define the API endpoint URL
url = "https://api.coinmarketcap.com/v1/ticker/"

# Make a GET request to the API
response = requests.get(url)

# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Extract JSON data from the response
    data = response.json()
    
    # Print the data (for demonstration purposes)
    print(data)
else:
    # Print an error message if the request failed
    print("Failed to fetch data from CoinmarketCap API")