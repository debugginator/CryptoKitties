pragma solidity ^0.5.0;

contract KittyBase {
	
	struct Kitty {
		uint256 geneticCode; // ili string kako smo pricali
		uint32 parent1_id;
		uint32 parent2_id;
		uint16 generation;
		uint64 birthTime;
	}

	event Birth(address owner, uint256 geneticCode, uint32 _parent1_id, uint32 _parent2_id, uint32 _id);

	function createKitty(
		address _owner,
		uint256 _geneticCode,
		uint32 _parent1_id,
		uint32 _parent2_id,
		uint16 _generation) 
		public
		returns (uint)
	{
		Kitty memory _kitty = Kitty({
			geneticCode: _geneticCode,
			parent1_id: _parent1_id,
			parent2_id: _parent2_id,
			generation: _generation,
			birthTime: uint64(now)
		});
		uint32 _kittyId = uint32(kitties.push(_kitty) - 1); // push returns new array length
		// emit Birth event
		emit Birth(_owner, _geneticCode, _parent1_id, _parent2_id, _kittyId);
		// todo assign ownership
		return _kittyId;
	}

	function getKittyById(uint32 _id)
		view
		public
		returns (
		uint256 geneticCode,
		uint32 parent1_id,
		uint32 parent2_id,
		uint16 generation)
	{
		return (kitties[_id].geneticCode,
				kitties[_id].parent1_id,
				kitties[_id].parent2_id,
				kitties[_id].generation);
	}

	/// @dev An array containing the Kitty struct for all Kitties in existence. The ID
    ///  of each cat is actually an index into this array.
    Kitty[] kitties;
}