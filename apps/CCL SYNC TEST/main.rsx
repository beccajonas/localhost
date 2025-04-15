<App>
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text1"
      style={{ ordered: [{ fontSize: "h1Font" }] }}
      value="Instance: **{{ retoolContext.configVars.instance_name }}**"
      verticalAlign="center"
    />
    <DynamicWidget_Lib_StringInput
      id="stringInput1"
      heightType="fixed"
      name={null}
    />
  </Frame>
</App>
