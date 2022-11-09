import axios from "axios";
export default axios.create({
  // baseURL: "http://70.12.50.209:8080/board",
  baseURL: "http://localhost:8080/board",
  headers: {
    "Content-Type": "application/json",
  },
});
