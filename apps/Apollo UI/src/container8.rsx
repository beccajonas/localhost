<Container
  id="container8"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  showHeaderBorder={false}
>
  <Header>
    <Text id="containerTitle13" value="#### Details" verticalAlign="center" />
    <Button
      id="button41"
      hidden="{{ editableText35.value === getImageDetails.data?.repositoryName && textInput44.value === getImageDetails.data?.deployUrl && textInput45.value === getImageDetails.data?.buildUrl }}"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Discard changes"
    >
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [{ value: "{{ getImageDetails.data?.repositoryName }}" }],
        }}
        pluginId="editableText35"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [{ value: "{{ getImageDetails.data?.deployUrl }}" }],
        }}
        pluginId="textInput44"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [{ value: "{{ getImageDetails.data?.buildUrl }}" }],
        }}
        pluginId="textInput45"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button40"
      hidden="{{ editableText35.value === getImageDetails.data?.repositoryName && textInput44.value === getImageDetails.data?.deployUrl && textInput45.value === getImageDetails.data?.buildUrl }}"
      text="Save changes"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <View id="06993" viewKey="View 1">
    <EditableText
      id="editableText34"
      label="Image name"
      placeholder="Enter value"
      readOnly="true"
      value="{{ getImageDetails?.data?.name }}"
    />
    <EditableText
      id="editableText33"
      label="Variant"
      placeholder="Enter value"
      readOnly="true"
      value="{{ getImageDetails?.data?.variant }}"
    />
    <EditableText
      id="editableText35"
      label="ECR repository"
      placeholder="Enter value"
      readOnly="true"
      value="{{ getImageDetails?.data?.repositoryName }}"
    />
    <Button
      id="button39"
      iconBefore="bold/interface-edit-pencil"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Change repository"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="changeSelectedRepository"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listRegistryForSelect2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <EditableText
      id="editableText36"
      label="Created At
"
      placeholder="Enter value"
      readOnly="true"
      value="{{ new Date(getImageDetails?.data?.createdAt).toDateString() }}"
    />
    <EditableText
      id="editableText37"
      label="Updated At"
      placeholder="Enter value"
      readOnly="true"
      value="{{ new Date(getImageDetails?.data?.updatedAt).toDateString() }}"
    />
    <TextInput
      id="textInput44"
      label="Deploy url"
      placeholder="Enter value"
      value="{{ getImageDetails?.data?.deployUrl }}"
    />
    <TextInput
      id="textInput45"
      label="Build url"
      placeholder="Enter value"
      value="{{ getImageDetails?.data?.buildUrl }}"
    />
  </View>
</Container>
