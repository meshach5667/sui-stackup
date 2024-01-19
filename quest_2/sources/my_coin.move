module quest_2::eva{
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // insert EVA struct
    struct EVA has drop {}


    // insert module initializer
    fun init(witness: EVA, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<EVA>(witness, 2, b"EVA", b"EVA", b"", option::none(), ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
}


    // insert mint function
    public entry fun mint(
    treasury_cap: &mut TreasuryCap<EVA>, amount: u64, recipient: address, ctx: &mut TxContext
) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
}


    // insert burn function
 public entry fun burn(treasury_cap: &mut TreasuryCap<EVA>, coin: Coin<EVA>) {
    coin::burn(treasury_cap, coin);
}

}