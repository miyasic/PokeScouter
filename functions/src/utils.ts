export const getIsEmulator = () => {
  return process.env["FUNCTIONS_EMULATOR"] === "true";
};
