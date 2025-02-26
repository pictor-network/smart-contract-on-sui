module pictor::user_asset;
use std::string::String;
//use sui::clock::Clock;

public struct UserAsset has key, store {
    id: UID,
    owner: address,  
    walrus_blob_id: String,      
    user_id: String,
    file_path: String,
    file_type: String,
    file_size: u64,
    created_at: u64
}

//create new user
public(package) fun new_user_asset(    
    owner: address,
    walrus_blob_id: String,
    user_id: String,
    file_path: String,
    file_type: String,
    file_size: u64,
    ctx: &mut TxContext
): UserAsset {
    UserAsset {
        id: object::new(ctx),        
        owner,
        walrus_blob_id,
        user_id,
        file_path,
        file_type,
        file_size,
        created_at: ctx.epoch_timestamp_ms()
    }
}

/// Deletes an asset
public(package) fun delete_asset(user_asset: UserAsset) {
    let UserAsset {
        id,
        owner: _,
        walrus_blob_id: _,
        user_id: _,
        file_path: _,
        file_type: _,
        file_size: _,
        created_at: _,        
    } = user_asset;
    object::delete(id);
}

// return user id
public fun get_id(user_asset: &UserAsset): ID {
    user_asset.id.to_inner()
}

// return walrus_blob_id
public fun get_walrus_blob_id(user_asset: &UserAsset): String {
    user_asset.walrus_blob_id
}

// return user_id
public fun get_user_id(user_asset: &UserAsset): String {
    user_asset.user_id
}

// return file_path
public fun get_file_path(user_asset: &UserAsset): String {
    user_asset.file_path
}

// return file_type
public fun get_file_type(user_asset: &UserAsset): String {
    user_asset.file_type
}

// return file_type
public fun get_file_size(user_asset: &UserAsset): u64 {
    user_asset.file_size
}

