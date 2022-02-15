#!/usr/bin/env python
# coding: utf-8

# In[1]:


# 1. import libraries
from bs4 import BeautifulSoup
import requests
import pandas as pd
import sys


# The first step of web scraping is to identify a website and download the html code from it.

# Create a function to scrape the https://www.billboard.com/charts/hot-100 songs and create a local dataframe of songs with them including:
# 
# 1. Song’s name
# 
# 2. Song’s artist
# 

# In[2]:


# 2. find url and store it in a variable
url= "https://www.billboard.com/charts/hot-100/"


# In[3]:


# 3. download html with a get request 
response = requests.get(url)


# In[4]:


response.content


# In[5]:


response.status_code # 200 status code means OK!


# In[6]:


# 4.1. parse html (create the 'soup')
soup = BeautifulSoup(response.content, "html.parser")
# 4.2. check that the html code looks like it should
soup


# In[7]:


#.c-title.a-no-trucate


# In[8]:


# 5. retrieve/extract the desired info (here, you'll paste the "Selector" you copied before to get the element that belongs to the top music)

soup.select(".c-title.a-no-trucate")


# In[9]:


soup.select(".c-label.a-no-trucate")


# # Building the dataframe

# In[10]:


#initialize empty lists
title = []
artist_name = []


# In[11]:


# define the number of iterations of our for loop 
# by checking how many elements are in the retrieved result set
# (this is equivalent but more robust than just explicitly defining 100 iterations)
num_iter = len(soup.select(".c-label.a-no-trucate"))


# In[12]:


print(num_iter)


# In[13]:


# iterate through the result set and retrive all the data
for i in range(num_iter):
    title.append(soup.select(".c-title.a-no-trucate")[i].get_text()) ## getting movies titles
    artist_name.append(soup.select(".c-label.a-no-trucate")[i].get_text()) ## getting artist_name


# In[14]:


print(title)


# In[15]:


len(title)


# In[16]:


print(artist_name)


# In[17]:


len(artist_name)


# In[22]:


# each list becomes a column
music_list = pd.DataFrame({"title":title,
                       "artist_name":artist_name
                      })

music_list


# # Cleaning the data

# In[24]:


music_list["title"]= music_list["title"].str.replace("\n", "")


# In[25]:


music_list["artist_name"]= music_list["artist_name"].str.replace("\n", "")


# In[26]:


music_list


# In[39]:


def html_to_dataframe(url, path1, path2):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")
    title = []
    artists = []
    num_iter = len(soup.select(path1))
    for song in range(num_iter):
        title.append(soup.select(path1)[song].get_text())
        artists.append(soup.select(path2)[song].get_text())
    music_list = pd.DataFrame({"title":title, "artist_name":artists})
    music_list["title"] = music_list["title"].str.replace("\n", "")
    music_list["artist(s)"] = music_list["artist_name"].str.replace("\n", "")
    return music_list


# In[41]:


html_to_dataframe("https://www.billboard.com/charts/hot-100/", ".c-title.a-no-trucate", ".c-label.a-no-trucate")


# In[40]:


user_song=input("Please enter a name of a song: ")

if user_song in music_list.values:
    print("Here is one song recommmendation: ")
    print(music_list.sample())
else:
    print("unfortunately, the song is not in the hot list.")


# In[ ]:





# In[48]:


#soup.select(".c-title.a-no-trucate")
soup.select(".c-label  a-font-primary-m")

