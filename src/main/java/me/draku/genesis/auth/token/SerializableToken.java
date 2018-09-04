package me.draku.genesis.auth.token;

import java.io.Serializable;

public final class SerializableToken implements Serializable {
    private final Token token;

    public SerializableToken(Token token) {
        this.token =  token;
    }

    public String getToken() {
        return token.toString();
    }
}
