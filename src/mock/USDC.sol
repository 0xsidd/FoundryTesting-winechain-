// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../Interfaces/IUSDC.sol";

contract Usdc is IERC20, ERC20Burnable, Ownable{
    constructor() ERC20("USDC", "USDC") {
        
        _mint(msg.sender, 10000000 * 10 * decimals());
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(to!=address(0),"Zero address sent");
        _mint(to, amount);
    }

   function decimals() public view virtual override(ERC20) returns (uint8) {
		return 18;
	}

    function transfer(address from, address to , uint256 _amount) external {
        require(to!=address(0),"Zero address sent");
        _transfer(from,to, _amount);
    }


}