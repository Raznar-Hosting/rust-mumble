/// the bandwidth (in bits) that the client can use
/// This mimics FiveM's current maximum
pub const MAX_BANDWIDTH_IN_BITS: u32 = 144_000;

// pub const MAX_BANDWIDTH_IN_BYTES: usize = MAX_BANDWIDTH_IN_BITS as usize / 8;

// So we can easily swap out the hash map if/when the need arises
pub type ConcurrentHashMap<K, V> = scc::HashIndex<K, V>;
