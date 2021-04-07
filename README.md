# Crypto Keeper
Crypto Keeper is an application that allows users to view the prices and graphs of the top 100 cryptocurrencies in real-time, sorted based upon total market cap.

To access the website navigate to the link below:

https://stormy-harbor-84296.herokuapp.com/

# Features

## Prices and Values
Crypto Keeper uses a CryptoCompare API to display the prices and numerous values of cryptocurrencies. Changes in price over the course of an hour and a day are also tracked and highlighted in either green or red to indicate whether the movement was positive or negative. To supplement this, the change in % of a price over the course of a day is also displayed to provide an additional layer of information about the asset.

![Home Interface](https://github.com/jtabba/CryptoKeeper/blob/main/public/documentation/home.png)

## Graphs
To provide a visual representation of the price fluctuations of all the top 100 cryptocurrencies, Crypto Keeper utilises and displays a line graph to plot the previous 3 month price movements of an asset. The graph is created using the Graph.js and Moment.js libraries, and is coded to render based upon the time and price of an asset at a certain time.

Additional information regarding more specific attributes of a crypto are also displayed on the left-hand side of the graph, hence providing a deeper insight into the distinct details and features of the token.

![Home Interface](public/documentation/graph.jpg)

## Crypto News

Crypto Keeper boasts a section dedicated to sharing the latest crypto related news. To access this section of the website, viewers must sign up and login to their Crypto Keeper account.

![Home Interface](public/documentation/news.jpg)

Signing up and logging in will then highlight and display the users username at the top of the page - everyone likes to feel a little special sometimes.

![Home Interface](public/documentation/loggedin.jpg)

Full CRUD functionality is incorporated for all posts, allowing the website admin to create, share, edit and delete anything that is posted on the page.

![Home Interface](public/documentation/login.jpg)

Clicking on a news headline navigates the user to a new page where the article content is displayed for reading.

![Home Interface](public/documentation/article.jpg)

## Security

Crypto Keeper utilises BCrypt to fully encrypt and salt user passwords in its database. Plaintext passwords are not stored in any way, shape, or form to improve security in the event of a data breach.

Steps have also been taken to mitigate the possibility of an SQL injection.

# Improvements and Future Features

A long list of improvements is currently planned for Crypto Keeper:

- Favourite cryptos of your choice and add them to a watchlist.
- Display favicon.
- Create a public forum where users can create and comment on discussion topics.
- Connect with MetaMask and display users' wallet balance in their (private) dashboard.
- Display a profile of assets held by a user in their dashboard.
- Incorporate Solidity to create an automated escrow smart contract which allows users to trade ERC-20/BEP-20 tokens OTC.
- Improve UI (specifically for 'Crypto News'/article) for a more aesthetically pleasing look.
- Display more information about a token when a user navigates to it.
- Enable the graph to display different time periods (currently hard coded for 3 months).

# Known Bugs
- Graph displays time in epoch time rather than DD/MM/YYYY.



