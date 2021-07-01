export interface WidgetsBridgePluginPlugin {

  /**
   * Return the value from user’s defaults database associated with the specified key
   * 
   * @param {UserDefaultsOptions} options 
   * @since 0.0.1
   * @returns {Promise<DataResults<any>>} Promise represents the value
   */
  getItem(options: UserDefaultsOptions): Promise<DataResults<any>>;

  /**
   * Set the value to user’s defaults database associated with the specified key
   * 
   * @param {UserDefaultsOptions} options 
   * @since 0.0.1
   * @returns {Promise<DataResults<boolean>>} Promise represents the operation results
   */
  setItem(options: UserDefaultsOptions): Promise<DataResults<boolean>>;

  /**
   * Remove the value from user’s defaults database associated with the specified key
   * 
   * @param {UserDefaultsOptions} options 
   * @since 0.0.1
   * @returns {Promise<DataResults<boolean>>} Promise represents the operation results
   */
  removeItem(options: UserDefaultsOptions): Promise<DataResults<boolean>>;

  /**
   * Reloads the timelines for all configured widgets belonging to the containing app
   * 
   * @since 0.0.1
   * @returns {Promise<DataResults<boolean>>} Promise represents the operation results
   */
  reloadAllTimelines(): Promise<DataResults<boolean>>;

  /**
   * Reloads the timelines for all widgets of a particular kind
   * 
   * @param {TimelinesOptions} options 
   * @since 0.0.1
   * @returns {Promise<DataResults<boolean>>} Promise represents the operation results
   */
  reloadTimelines(options: TimelinesOptions): Promise<DataResults<boolean>>;
}

export interface UserDefaultsOptions{
  /**
   * The key whose value to retrieve from storage.
   *
   * @since 0.0.1
   */
  key: string;

  /**
   * User defaults database name which holds and organizes key/value pairs
   *
   * @since 0.0.1
   */
  group: string;

  /**
   * The value to set in storage with the associated key
   *
   * @since 0.0.1
   */
  value?: string;
}

export interface TimelinesOptions{
  /**
   * A string that identifies the widget and matches the value you used when you created the widget’s configuration
   *
   * @since 0.0.1
   */
  ofKind: string;
}

export interface DataResults<T>{
  /**
   * Holds response results from native code
   *
   * @since 0.0.1
   */
  results: T;
}