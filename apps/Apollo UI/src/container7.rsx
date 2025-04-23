<Container
  id="container7"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle12"
      value="#### Artifact details"
      verticalAlign="center"
    />
  </Header>
  <View id="11c4c" viewKey="View 1">
    <EditableText
      id="editableText26"
      label="Image"
      placeholder="Enter value"
      readOnly="true"
      value="{{url.hashParams?.image}}/{{ url.hashParams?.variant }}"
    />
    <EditableText
      id="editableText30"
      label="Tag"
      placeholder="Enter value"
      readOnly="true"
      value="{{ url.hashParams?.tag }}"
    />
    <EditableText
      id="editableText27"
      label="Revision"
      placeholder="Enter value"
      readOnly="true"
      value="{{ url.hashParams?.revision }}"
    />
    <Text id="text25" value="**Status**" verticalAlign="center" />
    <TagsWidget2
      id="tags1"
      allowWrap={true}
      data="{{ [getBuildPlanDetails.data?.status] }}"
      labels=""
      margin="0"
    />
    <EditableText
      id="editableText28"
      label="Updated at"
      placeholder="Enter value"
      readOnly="true"
      value="{{ new Date(getBuildPlanDetails.data?.updatedAt).toDateString() }}"
    />
    <EditableText
      id="editableText29"
      label="Created at"
      placeholder="Enter value"
      readOnly="true"
      value="{{ new Date(getBuildPlanDetails.data?.createdAt).toDateString() }}"
    />
    <Button id="button34" text="Build">
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="applyBuildPlan"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button36"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Discard"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="discardBuildPlan"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
