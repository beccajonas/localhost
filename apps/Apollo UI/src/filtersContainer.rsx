<Container
  id="filtersContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="collapsibleTitle1"
      value="###### Filters"
      verticalAlign="center"
    />
    <ToggleButton
      id="collapsibleToggle1"
      horizontalAlign="right"
      iconForFalse="bold/interface-arrows-button-down"
      iconForTrue="bold/interface-arrows-button-up"
      iconPosition="replace"
      styleVariant="outline"
      text="{{ self.value ? 'Hide' : 'Show' }}"
      value="{{ filtersContainer.showBody }}"
    >
      <Event
        event="change"
        method="setShowBody"
        params={{ ordered: [{ showBody: "{{ self.value }}" }] }}
        pluginId="filtersContainer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </ToggleButton>
  </Header>
  <View id="630b2" viewKey="View 1">
    <RadioGroup
      id="logsFilters"
      itemMode="static"
      label=""
      labelPosition="top"
      value=""
    >
      <Option id="cf131" label="Filter by agent" value="agent" />
      <Option id="e335b" label="Filter by resource" value="resource" />
    </RadioGroup>
    <Container
      id="agentFilters"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{ logsFilters.value != 'agent' }}"
      margin="0"
      padding="12px"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle10"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="113ba" viewKey="View 1">
        <TextInput
          id="agentName"
          hidden="false"
          label="Agent"
          placeholder="Ex: test"
        />
      </View>
    </Container>
    <Container
      id="resourceFilters"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{ logsFilters.value != 'resource' }}"
      margin="0"
      padding="12px"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle11"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="113ba" viewKey="View 1">
        <Select
          id="selectResource"
          emptyMessage="No options"
          itemMode="static"
          label="Select Resource type"
          overlayMaxHeight={375}
          placeholder="Select a type"
          showSelectionIndicator={true}
        >
          <Option id="82c56" label="Internal image" value="image" />
          <Option id="04870" label="External image" value="image-external" />
          <Option id="6f331" label="Dependency" value="dependency" />
        </Select>
        <TextInput
          id="resourceName"
          label="Resource name"
          placeholder="Ex: node"
        />
      </View>
    </Container>
    <ButtonGroup2
      id="filtersActions"
      alignment="right"
      hidden="{{ !logsFilters.value }}"
      overflowPosition={2}
    >
      <ButtonGroup2-Button id="35e13" styleVariant="outline" text="Clear">
        <Event
          event="click"
          method="run"
          params={{
            ordered: [
              {
                src: "logsFilters.resetValue()\nagentName.resetValue()\nselectResource.resetValue()\nresourceName.resetValue()\n\nupdateSearchParams.trigger()",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button
        id="dd88c"
        disabled="{{ !((logsFilters.value == 'agent' && (!!agentName.value)) || (logsFilters.value == 'resource' && (!!resourceName.value && !!selectResource.value))) }}"
        styleVariant="solid"
        text="Search"
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="updateSearchParams"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
  </View>
</Container>
