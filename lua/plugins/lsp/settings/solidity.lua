return {
  solidity = {
    includePath = "lib/",
    remapping = {
      ["forge-std/"] = "lib/forge-std/src/",
      ["vulcan/"] = "lib/vulcan/src/",
      ["openzeppelin"] = "lib/openzeppelin-contracts/contracts/",
      ["ds-test"] = "lib/ds-test/src/",
      ["uniswap-v2-core/"] = "/=lib/v2-core/contracts/",
      ["uniswap-v2-periphery/"] = "lib/v2-periphery/contracts/",
    },
  },
}
