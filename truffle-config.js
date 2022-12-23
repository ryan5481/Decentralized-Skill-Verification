module.exports = {
  // Smart contract ABIs can only be imported vis src on React
  contracts_build_directory: path.join(__dirmane, "src/abis"),
  networks: {
    development: {
      host: "127.0.0.1", // localhost
      port: 7545, // ganache dev server's default port
      network_id: "*",
    },
  },
  compilers: {
    solc: {
      version: "0.8.1", //solidity version
    },
  },
};
