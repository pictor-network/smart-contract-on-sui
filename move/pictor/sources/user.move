module pictor::user;
use std::string::String;
//use sui::clock::Clock;

public struct User has key, store {
    id: UID,
    owner: address,        
    guid: String,
    full_name: String,
    email_address: String,
    user_role: String,
    phone_number: String,
    address: String,
    created_at: u64
}

//create new user
public(package) fun new_user(    
    owner: address,
    guid: String,
    full_name: String,
    email_address: String,
    user_role: String,
    phone_number: String,
    address: String,    
    ctx: &mut TxContext
): User {
    User {
        id: object::new(ctx),        
        owner,
        guid,
        full_name,
        email_address,
        user_role,
        phone_number,
        address,
        created_at: ctx.epoch_timestamp_ms()
    }
}

/// update user
public fun update_user(user: &mut User, full_name: String, email_address: String, user_role: String, phone_number: String, address: String ){
    user.full_name = full_name;
    user.email_address = email_address;
    user.user_role = user_role;
    user.phone_number = phone_number;
    user.address = address;    
}

// return user id
public fun get_id(user: &User): ID {
    user.id.to_inner()
}

// return user_full_name
public fun get_user_full_name(user: &User): String {
    user.full_name
}

// return user_email_address
public fun get_user_email_address(user: &User): String {
    user.email_address
}

// return user_role
public fun get_user_role(user: &User): String {
    user.user_role
}

// return user_phone_number
public fun get_user_phone_number(user: &User): String {
    user.phone_number
}

//return user_address
public fun get_user_address(user: &User): String {
    user.address
}
