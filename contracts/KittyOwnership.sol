pragma solidity ^0.5.0;

import "./KittyBase.sol";
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';

contract KittyOwnership is KittyBase, ERC721Mintable { 
	/// @notice Name and symbol of the non fungible token, as defined in ERC721.
	string public constant name = "CryptoKitties";
	string public constant symbol = "CK";
}