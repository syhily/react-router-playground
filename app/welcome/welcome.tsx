import { Flex, Text, Button } from "@radix-ui/themes";

export function Welcome() {
  return (
    <Flex direction="column" gap="2">
			<Text>Hello from Radix Themes :)</Text>
			<Button>Let's go</Button>
		</Flex>
  );
}
