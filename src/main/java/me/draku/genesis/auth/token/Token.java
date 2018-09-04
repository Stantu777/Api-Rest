package me.draku.genesis.auth.token;

import me.draku.genesis.auth.token.exception.InvalidToken;

import java.util.ArrayList;
import java.util.List;

public final class Token {
    private long accountId = Long.MIN_VALUE;

    private String hash = null;

    private List<Character> bucket = new ArrayList<>();

    public Token() {}

    public Token(String token) throws InvalidToken {
        final int length = token.length();

        int pos = 0;
        boolean prevCharJump = true;

        for (int i = 0; i < length; i++) {
            final char c = token.charAt(i);

            if (c == '.') {
                if (prevCharJump || pos == 2) {
                    throw new InvalidToken();
                }

                switch (pos) {
                    case 0:
                        try {
                            accountId = new Long(this.makeStrFromBucket());
                        }
                        catch (NumberFormatException e) {
                            throw new InvalidToken();
                        }

                        break;
                    case 1:
                        hash = this.makeStrFromBucket();
                        break;
                    default:
                        throw new InvalidToken();
                }

                bucket.clear();

                pos += 1;
                prevCharJump = true;

                continue;
            }

            bucket.add(c);
            prevCharJump = false;
        }

        // bucket.clear();
        bucket = null;

        if (this.isEmpty()) {
            throw new InvalidToken();
        }
    }

    private boolean isEmpty() {
        return this.accountId == Long.MIN_VALUE && this.hash == null;
    }

    private String makeStrFromBucket() {
        StringBuilder r = new StringBuilder(bucket.size());

        for (Character c: bucket) {
            r.append(c);
        }

        return r.toString();
    }

    @Override
    public String toString() {
        return Long.toString(this.getAccountId()) + "." + this.hash;
    }



    public long getAccountId() {
        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }
}
