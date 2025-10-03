module admin_addr::MULTOS_V4 {
    use 0x1::aptos_coin::AptosCoin;
    use 0x1::coin::transfer;
    use 0x1::primary_fungible_store;
    use 0x1::object::Object;
    use 0x1::fungible_asset::Metadata;

    const FEE_PERCENTAGE: u64 = 1; //1%
    const FEE_DENOMINATOR: u64 = 100;

    //error handling
    const NOT_AUTHORIZED: u64 = 1;
    const INVALID_LENGHT: u64 = 42;

    struct FeeConfig has key {
        collector: address,
    }
}