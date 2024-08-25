// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AchievementNFT {
    struct Achievement {
        uint256 id;
        string name;
        string description;
        string metadataURI; // URI pointing to NFT metadata (JSON with image, name, description, etc.)
    }

    uint256 private nextAchievementId;
    address public owner;
    mapping(address => Achievement[]) public achievements;

    event AchievementCreated(
        address indexed recipient,
        uint256 achievementId,
        string name,
        string description,
        string metadataURI
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
        nextAchievementId = 1;
    }

    function createAchievement(
        address recipient,
        string memory name,
        string memory description,
        string memory metadataURI
    ) public onlyOwner {
        Achievement memory newAchievement = Achievement({
            id: nextAchievementId,
            name: name,
            description: description,
            metadataURI: metadataURI
        });

        achievements[recipient].push(newAchievement);
        emit AchievementCreated(recipient, nextAchievementId, name, description, metadataURI);
        nextAchievementId++;
    }

    function getAchievements(address recipient) public view returns (Achievement[] memory) {
        return achievements[recipient];
    }

    function getAchievement(address recipient, uint256 achievementId) public view returns (Achievement memory) {
        Achievement[] memory userAchievements = achievements[recipient];
        for (uint256 i = 0; i < userAchievements.length; i++) {
            if (userAchievements[i].id == achievementId) {
                return userAchievements[i];
            }
        }
        revert("Achievement not found");
    }
}
