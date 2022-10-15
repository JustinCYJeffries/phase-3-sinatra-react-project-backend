# Crypto Profit Calculator
The Crypto Profit calculator allows you to monitor and track the profit of your portfolios. The calculator uses live crypto currency prices to calculate profits, and allows you to enter cryptocurrencies, the amount purchased and the price point of the time of purchase to calculate this profit. The calculator also tracks past trades by allowing you to mark cryptocurrencies as paid. When a cryptocurrency is marked paid, the profit at the moment of sale is recorded. 

## Installation

This is the backend file that must be run in order to set up the server to communicate data to the front end. To start the back end, fork and clone this repo, install the gems, navigate to the folder and then run this in terminal:

```bash
$ bundle exec rake server
```
Once running the front end must then be set up in order to use the app. The front end can be found here: https://github.com/JustinCYJeffries/phase-3-react-frontend

## Usage
Once the front and back end are both running, the app is used by first either choosing a portfolio or creating a new one. Then you can choose a cryptocurrency from the left side. Once a cryptocurrency is chosen you can either view what has been previously recorded or new purchases can be recorded. Alternatively previous purchases can be deleted as well.

The seed file populates the dummy data. A limitation of the number of api calls allowed to be made limits the amount of cryptocurrencies that are able to be shown. 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Acknowledgements
This app utilizes the faker ruby gem in order to create dummy data.
https://github.com/faker-ruby/faker

This app also uses the Cryptocompare ruby gem in order to receive live updates and live pricing, as well as populating the cryptocurrency list. https://github.com/alexanderdavidpan/cryptocompare
