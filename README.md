# Taco Bell® Meals API
An API for saving your Taco Bell® items into lists so you can maximize the efficiency of your Taco Bell® trips. Comes with a CSV of Taco Bell® menu items along with their prices and nutrional info.
## Front End
[Front end repo](https://github.com/jltyler/taco-bell-meal-front)
## Endpoints
### Authorization
Verb | URI Pattern | Action
POST | `/sign-up` | `users#signup`
POST | `/sign-in` | `users#signin`
DELETE | `/sign-out/:id` | `users#signout`
PATCH | `/change-password/:id` | `users#changepw`
GET | `/users` | `users#index`
GET | `/users/:id` | `users#show`

### Menu
GET | `/menu-items` | `menu_items#index`
GET | `/menu-items/:id` | `menu_items#show`

### Meals (requires token)
GET | `/meals` | `meals#index`
GET | `/meals/:id` | `meals#show`
POST | `/meals/:id` | `meals#create`
PATCH | `/meals/:id` | `meals#update`
DELETE | `/meals/:id` | `meals#destroy`
GET | `/meal-items/:id` | `meals#get_items`
POST | `/add-item/:id` | `meals#add_item`
DELETE | `/delete-item/:id` | `meals#delete_item`
