# chat

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
api

write an api to get 1000 records at a time post
time to fetch record, data pack , resources 1000 items pool heap, server engagement is must

paging --- optimization low page -- as per client server send

server will write new api in which they expect unique id from which they start to fetch data from cloud, pagesize
unique id --> 10
if loadmore is true then i have to make a server next item request

//
web
ios 2 second
android 5 second
flutter

1 -- crd - md
2 true
3 give id 3 to server pagesize = 3

4 true
5
6 true id 6 to server page size = 3
7
8
9 true id 9 to server page size = 3
10  
11
12 true id 12 to server page size = 3
13
14
15 false id 9 to server page size = 3
false --- no need to call api


//what's app

1. main page
   ---- fetch all the chats in which you logged in user is participent created date desc all the message
   no of list chats --> last message --- date time , profile pic of sender of that message naam(1 -2-1 other user , group -- group name), ...

now when you open a chat group
2. one to one chat/ group chat
   if its one to one chat then fetch all the records of that one to one chat in asecending order and move list to the unread record of that chat

50 ( 2 message read , 48-unread)

message send single tick,delivered double tick and once message read blue tick


if its group chat then fetch all the records of that group chat in asecending order and move list to the unread record of that chat

message --- 1 entry
message receiver --- n entry .... shyam -- read ,ramesh--deliver, xyz -- send


///1000

//0- 50 bunch

//50 items in db dump

//server trip 51 -100 bunch
db dump
list show


//trip i go with 100 no id to fetch 50 page


//pure 20
10 20-40
31 40-60

list mein item add -- aspect , rendering 

 
 




