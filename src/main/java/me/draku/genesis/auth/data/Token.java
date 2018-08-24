package me.draku.genesis.auth.data;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Token {

    private String userId;

    private String hash;

    private String createdAt;

    public Token(String token) throws Exception {
        final int length = token.length();

        int pos = 0;
        boolean prevCharJump = true;

        List<Character> userId    = new ArrayList<Character>(),
                        hash      = new ArrayList<Character>(),
                        createdAt = new ArrayList<Character>();

        for (int i = 0; i < length; i++) {
            char c = token.charAt(i);

            if (c == '.') {
                if (prevCharJump) {
                    throw new Exception("");
                }

                pos += 1;
                prevCharJump = true;
                continue;
            }

            prevCharJump = false;

            switch (pos) {
                case 0:
                    userId.add(c);
                    continue;
                case 1:
                    hash.add(c);
                    continue;
                case 2:
                    createdAt.add(c);
            }
        }

        // Usually you'd check that all of the lists weren't empty
        // But if the last one is empty that means the others are as well.
        if (createdAt.isEmpty()) {
            throw new Exception("");
        }

        this.userId = userId.stream().map(String::valueOf).collect(Collectors.joining());
        this.hash = hash.stream().map(String::valueOf).collect(Collectors.joining());
        this.createdAt = createdAt.stream().map(String::valueOf).collect(Collectors.joining());
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
