<Container
  id="steppedContainer5"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showFooter={true}
  showHeader={true}
>
  <Header>
    <Steps
      id="steps5"
      horizontalAlign="center"
      itemMode="static"
      navigateContainer={true}
      showStepNumbers={true}
      targetContainerId="steppedContainer5"
      value="{{ self.values[0] }}"
    >
      <Option id="0f6bf" value="Step 1" />
      <Option id="db541" value="Step 2" />
      <Option id="de5c1" value="Step 3" />
    </Steps>
  </Header>
  <View id="a19d0" label="Build type" viewKey="Step 1">
    <Spacer id="spacer2" />
    <RadioGroup
      id="buildType"
      groupLayout="wrap"
      itemMode="static"
      label="Chosse build type"
      labelPosition="top"
      style={{
        ordered: [
          { sharedLabelFontSize: "h4Font" },
          { sharedLabelFontWeight: "h4Font" },
          { sharedLabelFontFamily: "h4Font" },
        ],
      }}
      value="{{ self.values[0] }}"
    >
      <Option id="44713" label="Patch" value="{{ true }}" />
      <Option id="6ed2c" label="Build ad hoc" value="{{ false }}" />
    </RadioGroup>
    <Spacer id="spacer1" />
    <TextInput
      id="tagInput"
      label="Provide Drata tag"
      labelPosition="top"
      placeholder="Ex: 21.0.1"
      required={true}
      style={{
        ordered: [
          { sharedLabelFontSize: "h4Font" },
          { sharedLabelFontWeight: "h4Font" },
          { sharedLabelFontFamily: "h4Font" },
        ],
      }}
    />
    <Text
      id="text39"
      value="Tags should follow Drata tagging conventions"
      verticalAlign="center"
    />
    <Spacer id="spacer3" />
  </View>
  <View id="7e84e" label="Set and verify plan" viewKey="Step 2">
    <Text
      id="text45"
      horizontalAlign="center"
      value="## Update versions and values"
      verticalAlign="center"
    />
    <Container
      id="container22"
      currentViewKey={
        '{{ getImageDependencies3.data?.data.length > 0 ? "View 1" : "View 2" }}'
      }
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
      showHeaderBorder={false}
    >
      <Header>
        <Text
          id="containerTitle27"
          value="#### Dependencies"
          verticalAlign="center"
        />
      </Header>
      <View id="8fe58" viewKey="View 1">
        <ListViewBeta
          id="listView5"
          _primaryKeys="{{ item.dependencyName }}/{{ item.dependencyVariant }}"
          data="{{ getImageDependencies3.data?.data }}"
          enableInstanceValues={true}
          hidden="{{ !getImageDependencies3.data || getImageDependencies3.data?.data.length === 0 }}"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container13"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="0"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle18"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="328c1" viewKey="View 1">
              <TextInput
                id="textInput56"
                label="{{ item.dependencyName }}/{{ item.dependencyVariant }}"
                placeholder="Enter value"
                value="{{ item.tag }}"
              >
                <Event
                  event="change"
                  method="run"
                  params={{ ordered: [] }}
                  pluginId=""
                  type="script"
                  waitMs="0"
                  waitType="debounce"
                />
              </TextInput>
            </View>
          </Container>
        </ListViewBeta>
      </View>
      <View
        id="25c0f"
        disabled={false}
        hidden={false}
        iconPosition="left"
        viewKey="View 2"
      >
        <Container
          id="container23"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          style={{ ordered: [{ background: "highlight" }] }}
        >
          <Header>
            <Text
              id="containerTitle28"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="8fe58" viewKey="View 1">
            <Text
              id="text48"
              horizontalAlign="center"
              value="No dependencies to review"
              verticalAlign="center"
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="container24"
      currentViewKey={
        '{{ getParameters3.data?.data.length > 0 ? "View 1" : "View 2" }}'
      }
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
      showHeaderBorder={false}
    >
      <Header>
        <Text
          id="containerTitle29"
          value="#### Parameters"
          verticalAlign="center"
        />
      </Header>
      <View id="8fe58" viewKey="View 1">
        <ListViewBeta
          id="listView6"
          _primaryKeys="{{ item.name }}"
          data="{{ getParameters3.data?.data }}"
          enableInstanceValues={true}
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container14"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="0"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle19"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="328c1" viewKey="View 1">
              <TextInput
                id="parameterInput"
                label="{{ item.name }}"
                placeholder="Enter value"
                value="{{ item.value }}"
              />
            </View>
          </Container>
        </ListViewBeta>
      </View>
      <View
        id="309df"
        disabled={false}
        hidden={false}
        iconPosition="left"
        viewKey="View 2"
      >
        <Container
          id="container25"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          style={{ ordered: [{ background: "highlight" }] }}
        >
          <Header>
            <Text
              id="containerTitle30"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="8fe58" viewKey="View 1">
            <Text
              id="text49"
              horizontalAlign="center"
              value="No parameters to review"
              verticalAlign="center"
            />
          </View>
        </Container>
      </View>
    </Container>
  </View>
  <View id="d21d4" viewKey="Apply plan">
    <Text
      id="text42"
      horizontalAlign="center"
      value="## Review and confirm"
      verticalAlign="center"
    />
    <Container
      id="container19"
      currentViewKey={
        '{{ getCreatedPlanDetails.data?.dependencies.length > 0 ? "View 1" : "View 2" }}'
      }
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
      showHeaderBorder={false}
    >
      <Header>
        <Text
          id="containerTitle24"
          value="#### Dependencies"
          verticalAlign="center"
        />
      </Header>
      <View id="8fe58" viewKey="View 1">
        <ListViewBeta
          id="listView7"
          _primaryKeys=""
          data="{{ getCreatedPlanDetails.data?.dependencies }}"
          hidden="{{ !getImageDependencies3.data || getImageDependencies3.data?.data.length === 0 }}"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container15"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="0"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle20"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="328c1" viewKey="View 1">
              <EditableText
                id="editableText43"
                editIcon="bold/interface-edit-write-1"
                inputTooltip="`Enter` to save, `Esc` to cancel"
                label="{{ item.dependencyName }}/{{ item.dependencyVariant }}"
                placeholder="Enter value"
                readOnly="true"
                value="{{ item.dependencyTag }}"
              />
            </View>
          </Container>
        </ListViewBeta>
      </View>
      <View
        id="d42ee"
        disabled={false}
        hidden={false}
        iconPosition="left"
        viewKey="View 2"
      >
        <Container
          id="container21"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          style={{ ordered: [{ background: "highlight" }] }}
        >
          <Header>
            <Text
              id="containerTitle26"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="8fe58" viewKey="View 1">
            <Text
              id="text47"
              horizontalAlign="center"
              value="No dependencies to review"
              verticalAlign="center"
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="container18"
      currentViewKey={
        '{{ getCreatedPlanDetails.data?.parameters.length > 0 ? "View 1" : "View 2" }}'
      }
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      showBody={true}
      showBorder={false}
      showHeader={true}
      showHeaderBorder={false}
    >
      <Header>
        <Text
          id="containerTitle23"
          value="#### Parameters"
          verticalAlign="center"
        />
      </Header>
      <View id="8fe58" viewKey="View 1">
        <ListViewBeta
          id="listView8"
          _primaryKeys=""
          data="{{ getCreatedPlanDetails.data?.parameters }}"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container16"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="0"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle21"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="328c1" viewKey="View 1">
              <EditableText
                id="editableText44"
                editIcon="bold/interface-edit-write-1"
                inputTooltip="`Enter` to save, `Esc` to cancel"
                label="{{ item.name }}"
                placeholder="Enter value"
                readOnly="true"
                value="{{ item.value }}"
              />
            </View>
          </Container>
        </ListViewBeta>
      </View>
      <View
        id="14c4b"
        disabled={false}
        hidden={false}
        iconPosition="left"
        viewKey="View 2"
      >
        <Container
          id="container20"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          style={{ ordered: [{ background: "highlight" }] }}
        >
          <Header>
            <Text
              id="containerTitle25"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="8fe58" viewKey="View 1">
            <Text
              id="text46"
              horizontalAlign="center"
              value="No parameters to review"
              verticalAlign="center"
            />
          </View>
        </Container>
      </View>
    </Container>
  </View>
  <Footer>
    <Button
      id="prevButton5"
      disabled="{{ steppedContainer5.currentViewIndex === 0 }}"
      hidden="{{ steppedContainer5.currentViewIndex !== 2 }}"
      iconBefore="bold/interface-arrows-left-alternate"
      styleVariant="outline"
      text="Return to update"
    >
      <Event
        event="click"
        method="showPreviousVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="steppedContainer5"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button48"
      hidden="{{ steppedContainer5.currentViewIndex + 1 !== steppedContainer5.viewKeys.length }}"
      style={{ ordered: [{ background: "danger" }] }}
      text="Discard"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="discardBuildPlan2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button50"
      disabled="{{ !tagInput.value }}"
      iconAfter={
        "{{ steppedContainer5.currentViewIndex !== 2 ?  \"/icon:bold/interface-arrows-right-alternate\" : ''  }}"
      }
      text="{{ steppedContainer5.currentViewIndex !== 2 ? 'Save and review' : 'Build'}}"
    >
      <Event
        enabled="{{ steppedContainer5.currentViewIndex === 0 }}"
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="createPlan2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ steppedContainer5.currentViewIndex  === 1}}"
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="modifyIfNeeded"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ steppedContainer5.currentViewIndex  === 2}}"
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="applyBuildPlan2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
