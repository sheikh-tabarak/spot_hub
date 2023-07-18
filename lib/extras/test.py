import requests
from bs4 import BeautifulSoup

url = "https://www.foodpanda.pk/restaurant/w5of/baba-g-chaska-point"

# Send a GET request to the URL
response = requests.get(url)

# Create a BeautifulSoup object from the response text
soup = BeautifulSoup(response.text, 'html.parser')

# Find all elements with class "f-title-small-font-size" for titles
titles = [title.text.strip() for title in soup.find_all(class_="f-title-small-font-size")]

# Find all elements with class "dish-description" for descriptions
descriptions = [desc.text.strip() for desc in soup.find_all(class_="dish-description")]

# Combine titles and descriptions into a list of products
products = list(zip(titles, descriptions))

# Print the list of products
for product in products:
    print(f"Title: {product[0]}")
    print(f"Description: {product[1]}")
    print("-------------------")