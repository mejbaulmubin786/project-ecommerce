-- Database Creation
CREATE DATABASE Demo1;
USE Demo1;

-- Table Creation
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE profiles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE posts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE tags (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE post_tags (
    post_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY (post_id, tag_id)
);

-- Data Insertion
-- Inserting 20 rows as sample data

-- Users
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Eve', 'eve@example.com');

-- Profiles
INSERT INTO profiles (user_id, bio) VALUES
(1, 'Bio for Alice'),
(2, 'Bio for Bob'),
(3, 'Bio for Charlie'),
(4, 'Bio for David'),
(5, 'Bio for Eve');

-- Posts
INSERT INTO posts (user_id, title, content) VALUES
(1, 'Alice\'s First Post', 'Content of Alice\'s first post'),
(2, 'Bob\'s Thoughts', 'Content of Bob\'s thoughts'),
(3, 'Charlie\'s Adventure', 'Content of Charlie\'s adventure'),
(4, 'David\'s Journey', 'Content of David\'s journey'),
(5, 'Eve\'s Insight', 'Content of Eve\'s insight');

-- Comments
INSERT INTO comments (user_id, post_id, content) VALUES
(1, 2, 'Alice comments on Bob\'s post'),
(2, 3, 'Bob comments on Charlie\'s post'),
(3, 4, 'Charlie comments on David\'s post'),
(4, 5, 'David comments on Eve\'s post'),
(5, 1, 'Eve comments on Alice\'s post');

-- Tags
INSERT INTO tags (name) VALUES
('Technology'),
('Science'),
('Education'),
('Health'),
('Travel');

-- Post_Tags
INSERT INTO post_tags (post_id, tag_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(2, 1),
(3, 4),
(4, 5),
(5, 3);
