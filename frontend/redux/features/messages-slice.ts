import { createSlice, PayloadAction } from "@reduxjs/toolkit";

type MessageState = {
  count: number;
  question: string;
};

const initialState = {
  count: -1,
  question: "",
} as MessageState;

export const messageSlice = createSlice({
  name: "Messages",
  initialState,
  reducers: {
    addQuestion: (state, action: PayloadAction<string>) => {
      state.question = action.payload;
    },
    startCount: (state) => {
      state.count = 5;
    },
    decrementCount: (state) => {
      state.count -= 1;
    },
  },
});

export const { addQuestion, startCount, decrementCount } =
  messageSlice.actions;
export default messageSlice.reducer;
