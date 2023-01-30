require('dotenv').config();

require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require('hardhat-contract-sizer');
require("@nomiclabs/hardhat-etherscan");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const { API_URL, PRIVATE_KEY } = process.env;

const DEFAULT_COMPILER_SETTINGS = {
  version: '0.8.4',
  settings: {
    optimizer: {
      enabled: false,
    },
  },
}

const OPTIMIZED_COMPILER_SETTINGS = {
  version: '0.8.4',
  settings: {
    optimizer: {
      enabled: true,
      runs: 1_000_000,
    },
  },
}

module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      url: "",
      accounts: [""],
    },
    polygonMumbai: {
      url: "",
      accounts: [""],
    },
    polygon: {
      url: API_URL,
      accounts: [PRIVATE_KEY],
    }
  },
  etherscan: {
    apiKey: {
      rinkeby: "",
      polygon: "",
      polygonMumbai: "",
    }
  },
  gasReporter: {
    currency: "USD",
    coinmarketcap: "",
    token: "MATIC",
    gasPriceApi: "https://api.polygonscan.com/api?module=proxy&action=eth_gasPrice"
  },
  solidity: {
    compilers: [OPTIMIZED_COMPILER_SETTINGS],
    overrides: {
      "contracts/sounds/CryptoMazeSounds1.sol": OPTIMIZED_COMPILER_SETTINGS,
      "contracts/sounds/CryptoMazeSounds2.sol": OPTIMIZED_COMPILER_SETTINGS,
      "contracts/sounds/CryptoMazeSounds3.sol": OPTIMIZED_COMPILER_SETTINGS,
      "contracts/fonts/CryptoMazeFont.sol": OPTIMIZED_COMPILER_SETTINGS,
    },
  },
  contractSizer: {
    alphaSort: true,
    disambiguatePaths: false,
    runOnCompile: true,
    strict: true,
    only: []
  }
};
