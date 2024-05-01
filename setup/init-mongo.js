const dbName = "hobbiton";
const username = "admin";
const password = "password";

db.createUser({
  user: username,
  pwd: password,
  roles: [
    {
      role: "readWrite",
      db: dbName,
    },
  ],
});

db = db.getSiblingDB(dbName);
