export let undoStack = $state<object[][]>([])

export const addUndo = () => {
   undoStack.push([])
}

export let redoStack = $state([])
