<DrawerFrame
  id="authenticationDrawer"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="{{ isAuthenticatedUser.value}}"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  width="large"
>
  <Header>
    <Text
      id="drawerTitle3"
      value="### Container title"
      verticalAlign="center"
    />
    <Button
      id="drawerCloseButton3"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="authenticationDrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text21"
      horizontalAlign="center"
      value="# Welcome to Apollo"
      verticalAlign="center"
    />
    <Text
      id="text22"
      horizontalAlign="center"
      value="_Please, be sure you are logged with your drata email in Retool to access_"
      verticalAlign="center"
    />
    <Button
      id="button22"
      style={{ ordered: [{ background: "success" }] }}
      text="Log in"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "if (retoolContext.environment === 'staging' || retoolContext.environment === 'production') {\n  await localStorage.setValue('token', 'temp-token')\n  redirectToLogin.trigger()\n} else {\n  utils.openUrl(auth.query)\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
</DrawerFrame>
