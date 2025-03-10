module owlchain.xdr.publicKeyType;

import std.conv;
import owlchain.xdr.type;
import owlchain.xdr.xdrDataInputStream;
import owlchain.xdr.xdrDataOutputStream;

enum PublicKeyType
{
    PUBLIC_KEY_TYPE_ED25519 = 0
}

static void encodePublicKeyType(XdrDataOutputStream stream, ref const PublicKeyType encodedType)
{
    int32 value = cast(int) encodedType;
    stream.writeInt32(value);
}

static PublicKeyType decodePublicKeyType(XdrDataInputStream stream)
{
    const int32 value = stream.readInt32();
    switch (value)
    {
        case 0:
            return PublicKeyType.PUBLIC_KEY_TYPE_ED25519;
        default:
            throw new Exception("Unknown enum value: " ~ to!string(value,10));
    }
}
/*
struct PublicKeyType
{
    static int PUBLIC_KEY_TYPE_ED25519 = 0;

    int type;

    void opAssign(PublicKeyType other)
    {
        type = other.type;
    }

    void opAssign(int value)
    {
        type = value;
    }

    int opCast() 
    {
        return type;
    }

    static void encode(XdrDataOutputStream stream, ref const PublicKeyType encodedType)
    {
        int32 value = cast(int) encodedType;
        stream.writeInt32(value);
    }

    static PublicKeyType decode(XdrDataInputStream stream)
    {
        const int32 value = stream.readInt32();
        switch (value)
        {
            case 0:
                return PublicKeyType.PUBLIC_KEY_TYPE_ED25519;
            default:
                throw new Exception("Unknown enum value: " ~ to!string(value,10));
        }
    }
}
*/