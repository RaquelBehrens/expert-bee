import { createSlice, PayloadAction } from "@reduxjs/toolkit";

type MessageState = {
  count: number;
  questions: string[];
};

const initialState = {
  count: -1,
  questions: [],
} as MessageState;

export const messageSlice = createSlice({
  name: "Messages",
  initialState,
  reducers: {
    addQuestion: (state, action: PayloadAction<string>) => {
      state.questions.push(action.payload);
    },
    startCount: (state, action: PayloadAction<number>) => {
      state.count = action.payload;
    },
    decrementCount: (state) => {
      state.count -= 1;
    },
  },
});

export const { addQuestion, startCount, decrementCount } =
  messageSlice.actions;
export default messageSlice.reducer;
