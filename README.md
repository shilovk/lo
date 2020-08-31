# Lunch Ordering SaaS
Each company that uses the services of delivery meals, sooner or later, comes to the great and original idea to develop their own service to order a lunch. Many start, but only few of them bring it to the end. The objective of this task is to develop very small MVP, which could be taken and used already in production.

We will try to simplify the problem as much as possible. Please find User Stories below. Let’s assume that there is only one organization in the application, all users belong to it.

- As a guest I should be able to sign up with name, email and password.
- As a guest I should be able to sign in with email and password.
- As a first registered user in the system, I became a Lunches Admin.
- As a user I can edit my profile
- As a user I can see a weekdays on the dashboard page
- As a user, when I click on the weekday(today or days in the past), I can see menu ­ list of items with prices.
- As a user, when I choose items from menu, I can only choose one item from the first course, one item from the main course and one drink. Total 3 items.
- As a user I can press Submit button to process my order.
- As a Lunches Admin, I can browse registered users.
- As a Lunches Admin, I can browse days and see users’ orders there.
- As a Lunches Admin, I can add items in menu only for today by adding a name and price.
- As a Lunches Admin, I can upload photo for each menu item
- As a Lunches Admin, on the date page I can see the list of orders and total lunch cost for today.

*Let’s assume that instead of calling to the Lunches Delivery Company, they have a smart ERP which can request the order for today through our API at a specific time.*
- As a system, I should be able to provide list of the orders for today with details for each person through RESTful JSON API endpoint.
- As a system, I should have a secure API.

### General Notes
- **The source code of application should be uploaded on github.com and deployed to heroku in the end.**
- Keep your code clean.
- Thin controllers, fat models. Don’t forget about validations
- Prefer quality to the speed of delivering this task
- The code should be covered with unit, functional and integration tests. (Please use RSpec+Capybara)
- Front­end can be pretty very simple.
- Connect Travis­CI to your public repository

### Recommended technologies
If you know your way, skip this step. Otherwise we are expecting from you to use these gems in project ­ Rails 4+, devise, twitter bootstrap, haml, simple_form, carrierwave, rspec, capybara

Next complexity level:
- Add organizations
- Add registration through Google Apps - Auto Suggest for menu items
- Weekly Menus

[ER Diagram](https://viewer.diagrams.net/?highlight=0000ff&edit=_blank&layers=1&nav=1&title=lunch-ordering.drawio#R7Z3vd5o8FMf%2FGl92h4AovJx27c5z2mf9se3Znjc7USJmQ8KJaa376xckKBhQqkShy9bTIyGEED73S7j3xnas4ezlmsJoeks8FHRMw3vpWJcd0%2Bz3Df47LlgmBZYrCnyKvaQIbAoe8W8kCtNqT9hD81xFRkjAcJQvHJMwRGOWK4OUkkW%2B2oQE%2BbNG0EdSweMYBnLpf9hjU1EKDGOz4yPC%2FlSc2rHFjhEc%2F%2FIpeQrF%2BTqmNVn9S3bPYNqWqD%2BfQo8sMkXWh441pISw5NPsZYiCeGjTYUuOuyrZu%2B43RSGrckCweL7%2FeeVffLz7%2BX8EgvDyoxteANtK2nmGwZMYkStCPNFltkyHab7AswCGfGswISF7FHsMvj2e4sC7gUvyFPdjzvi4pFuDKaH4N68PA74L8AK%2BmzJBgdmNW8NBMCQBoavzWMiI%2F%2BeOfIxbFOeiaM6PvUsvGmwV3cKXXMUbOGdpL0kQwGiOR6t%2BxwfOIPVxOCCMkZmolF7lVb5T4r5aAxhgP%2BRlY34uRNOxSK4GxFcj3xRxn54RZeglUyRu0jUiM8ToklcRe82emxwiDMrp9ZLtRQZPR0A1zZAJnK4wC2ES%2FrrtDRb8gyDjVZR0JUpwASNTGMUf%2BeUzDIMHbq4w9OO9A0YiMcQBmqS3hIq%2Bx59H6W0AmWFO6g7iscPcYt%2BL4hn2vFWrWXZCsoJzHsExDv2b5CyxFa%2FLHsTp4vtEeJuTYGWOU94aCuPuEAYZHK25jggO2Woo7QH%2F4SM%2BNN7ZHZtf6pBvg802%2F4mrUzYk4ZxRiFc3H3H4FigGcOBREn3muKH0crM2BLY4Mgs52mO%2B%2B%2FESOJndajRZhjKYbAmmEfbjMTsWqFHWlgvgqMpVHqJuXQjtoyS%2BzBIe8ppbFY5uCRzrp6noau6JlIMmQ4l7Wkh6EiQMM95bJaJj7Idj1VjbFaeEqIK5RF1yY1eUG7OnjKS%2BRBIfMX53zi03CVFvRWt6JWTUpjXqCOnJWjOGDPmELn%2BomuZoxVGlOKm6nE9xerLiNGOC86YUp9dixbEdiZCI4rGe3bRMa4BR8d1cIUquhBK%2FEVBrTa2zG6eEjEZpzdcvAE%2F%2Bub9nk4uJ%2BePKx%2Ffu9wv5WTSmiM9uvB81MKLlplRuClCpqkDlcmOZp5ObQprk55bHWWJ4dvyj6%2B%2FRm8oqkkem3LwbNLPpGRIhT5Gn9aad05v0uXfGdykg8aQVR8Xb1Gu1qUGa4zgSCqu4LPLE0PJxnBKfhDC4ISsQ4mH7iRhbinGDT4zwoimb5eKU7%2BP4Mi%2F48DCDofcpUYx4RxwfFG2j0NtU%2B40o%2BUxuYbhM9oh6QLorfO8LZt%2FEvvjz97ic60OydfmSqXa5TDc8H6VtoGBEFh82Bfx0fDC%2FrXvFNzJNxpubNldbaaMyIeK%2Bz8kTHaNdA2%2BJSA5LtWrvy3p8BTuVh6IAMvyMcj0pQkYcekdWfpVN8FSQJxTMTV%2BP0iaSroqjstHyrYZAPx%2BFBYa71ZlkeKSWOAxwmakmzLq8x93iHm8sImlxYx%2Fr0Tp8Gmf1JYvZydbR5nQQ7QcCvWW6OZvMWi%2FYtt6NkW9Md2MhW%2BjuNZnCgTcLLKawIjDrsI%2FXwth18jA6XeMEMMry3WAYwVEwHv8cOQzGQlU2jco0ds9BY9%2FcohFsZTht1wf5%2Bn3HUk8vkCeon6iHqDw71RlUncoZVHu8J7szqOwtDqpnUKXvO7X7TYApUaITqNQnUO3BaIdBNyJ%2Fqrh%2FcsZmM6KL7UqfqtMJVzZZO0H21I7Hdd4JN0dUJzOc0%2BN%2FiNicMnuquH9yrqZOnjqn0pRMxM8VXQQ6keEt6Mwpc6aK%2B6ezGBolM06zZCbtuM5iaL%2FWnDRnqpgmHVNsmN40LWnKlN01OouhrXpz9qQpU%2FbYaL05r94c5rBRRojlSiCcJgSWxrmqhMAaElfdtdZRQT5BPg2g72z57EryCY7NAnC69YauSvI3ZD%2FhUCx8koVJRfiqtyVabyV8ddQXAFh5FFxQNXpl1RC92p3oo8NXDVv%2Fb5Ut8S6PX1WkKW1ZAUzycksdwHr9fKgCHHYJHPWt%2F3ffcbnq99z0tzJm5GUs%2BusAzp5R%2Fnr16Z3Q0VzSZzlioSNa9UtPv4SMFqSTd%2BVYhHY2t1VwnPMv0JVjF9r7o0By1mbbQsmx5YiE9je3VXJAmux5Rs2R4xdacxRojl0etmiQ5hS7wGXfX%2FzFnzp3%2Fby565LDuVvxjWnbMV0fKLLvj8SQKMsm1R7A4xLYzZJQSFMS2E3t%2F2tcPNQ%2B6OGkDhHZ3TfhDyedwN645Is9YnP2BHZTdvc1Q2xaNA%2BuVWka9oU1piHPg7%2FMTzUF1vHvClNgYLhVowZdUxkmOgLeyAj4xn7bEwE3DT0DPol%2FZmO16iLg5jvLMVzbTH%2BrYqZghQyaQRxoDVKnQbwV8gttXZs6YaoaHFf2VxfMgnU2zQiOvzVhAsqDVeogMWQlYstIp%2BKcM0x1gNpUnlQre%2FUCTVWbFr2bVyCjFXHxZ%2Ffm%2BtL%2BdxEtvt5%2FnVw%2FWJO77xfyupkIzucLQrUbsGViA6omsStjSXbzaK05Qmt22mujlaYEaTniEMIasiW0zhzz6Hq9zqQewP2uQmUk6QTjU8xq1CcY10BI8WJPiQ%2FozXCopUad1BzyxziE%2BpRLTdVvlVQGkjylGRESIHg8Sn%2BP0tQZ2yz54y0n0JmS92s5ZqUXMrT2DaoB%2Fho5bKWzihXMbYDyqJVCRuT3KL2Soa2aY57Sa1PCk%2F6LY6fRnCYu2OSblBCW%2FdYTCqPpLfFQXOMP)
