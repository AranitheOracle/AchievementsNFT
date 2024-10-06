module AchievementNFT {
    struct Achievement has copy, drop, store {
        id: u64,
        name: vector<u8>,
        description: vector<u8>,
        metadata_uri: vector<u8>, // URI pointing to NFT metadata (JSON with image, name, description, etc.)
    }

    resource struct AchievementHolder has key {
        achievements: vector<Achievement>,
        next_achievement_id: u64,
    }

    struct Owner has key {
        address: address,
    }

    public fun create_achievement(
        owner: &mut Owner,
        recipient: &signer,
        name: vector<u8>,
        description: vector<u8>,
        metadata_uri: vector<u8>
    ) {
        let achievement_holder = &mut borrow_global_mut<AchievementHolder>(signer::address_of(recipient));
        let new_achievement = Achievement {
            id: achievement_holder.next_achievement_id,
            name: name,
            description: description,
            metadata_uri: metadata_uri,
        };

        vector::push_back(&mut achievement_holder.achievements, new_achievement);
        achievement_holder.next_achievement_id = achievement_holder.next_achievement_id + 1;
    }

    public fun get_achievements(recipient: &signer): vector<Achievement> acquires AchievementHolder {
        let achievement_holder = borrow_global<AchievementHolder>(signer::address_of(recipient));
        return achievement_holder.achievements;
    }

    public fun get_achievement(recipient: &signer, achievement_id: u64): Achievement acquires AchievementHolder {
        let achievement_holder = borrow_global<AchievementHolder>(signer::address_of(recipient));
        let achievements = &achievement_holder.achievements;

        let len = vector::length(achievements);
        let mut i = 0;
        while (i < len) {
            let achievement = vector::borrow(achievements, i);
            if (achievement.id == achievement_id) {
                return *achievement;
            }
            i = i + 1;
        }
        abort 1; // Achievement not found
    }

    public fun init_module(owner: &signer) {
        let achievement_holder = AchievementHolder {
            achievements: vector::empty<Achievement>(),
            next_achievement_id: 1,
        };
        move_to(owner, achievement_holder);

        let new_owner = Owner {
            address: signer::address_of(owner),
        };
        move_to(owner, new_owner);
    }
}
