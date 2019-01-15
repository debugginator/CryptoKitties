# CryptoKitties
Re-implementation of the CryptoKitties project for an university class study using [truffle framework](truffleframework.com).

### Prerequisites
This program is made to be run using truffle framework, to install it follow the steps from their official [installation guide](https://truffleframework.com/docs/truffle/getting-started/installation).

## Testing
To run all of the tests from the [test folder](test) simply run
`truffle test`

## Runing using truffle develop
First run truffle's built-in personal blockchain with:

`truffle develop`

You will be presented with the command-line interpreter and a list of Ethereum accounts you can use for testing.

Now you can run `compile` inside the cli to compile the contracts, after which you can deploy them on the truffle's blockchain using the `migrate` command.

After this is set up try playing around with commands like [these](notes/kitty_truffle_commands.txt).
