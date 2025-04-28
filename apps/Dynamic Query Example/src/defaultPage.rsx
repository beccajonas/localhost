<Screen
  id="defaultPage"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="Default Page"
  urlSlug=""
>
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Text
      id="text1"
      value="*current_user.metadata.region:* **{{ current_user.metadata.region }}**"
      verticalAlign="center"
    />
    <Image
      id="image1"
      aspectRatio=""
      heightType="fixed"
      horizontalAlign="center"
      src="{{ query1.data.message }}"
    />
    <Button
      id="button1"
      text={
        'Get A New {{ current_user.metadata.region === \'EU\' ? "Mountain Dog" : "Retreiver" }}\n'
      }
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="query1"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Frame>
</Screen>
