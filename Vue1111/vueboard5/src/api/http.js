import axios from "axios";
export default axios.create({
  baseURL: "http://localhost:8090/board10/board",
  headers: {
    "Content-Type": "application/json",
  },
});
