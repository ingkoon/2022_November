import axios from "axios";
export default axios.create({
  baseURL: "http://localhost:8080/whereismyhome/board",
  headers: {
    "Content-Type": "application/json",
  },
});
